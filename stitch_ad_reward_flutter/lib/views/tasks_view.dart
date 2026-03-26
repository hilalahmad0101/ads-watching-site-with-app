import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/tasks_view_model.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TasksViewModel(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          title: Row(
            children: const [
              Icon(Icons.payments, color: AppColors.primary, size: 28),
              SizedBox(width: 8),
              Text('EMERALD LEDGER'),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined, color: Colors.grey),
            ),
          ],
        ),
        body: Consumer<TasksViewModel>(
          builder: (context, viewModel, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Section
                  _buildProgressHero(context, viewModel),
                  const SizedBox(height: 32),
                  
                  // Daily Tasks
                  _buildSectionHeader("Daily Tasks", "Resets in ${viewModel.resetsIn}"),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: viewModel.dailyTasks.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final task = viewModel.dailyTasks[index];
                      return _buildTaskItem(context, task);
                    },
                  ),
                  const SizedBox(height: 32),
                  
                  // Weekly Challenges
                  _buildSectionHeader("Weekly Challenges", ""),
                  const SizedBox(height: 16),
                  _buildWeeklyChallenge(context),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildSmallChallenge(Icons.groups, "Refer 5", "2/5"),
                      const SizedBox(width: 16),
                      _buildSmallChallenge(Icons.military_tech, "Win 3 Ads", "DONE"),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Special Missions
                  _buildSectionHeader("Special Missions", ""),
                  const SizedBox(height: 16),
                  _buildSpecialMission(context),
                  const SizedBox(height: 120),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProgressHero(BuildContext context, TasksViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.surfaceContainerLow, AppColors.surface],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.onSurfaceVariant.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Level ${viewModel.level} Miner'.toUpperCase(),
                    style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                  ),
                  const Text(
                    'Daily Progress',
                    style: TextStyle(color: AppColors.onSurface, fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.bolt, color: AppColors.primary, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '${viewModel.xp} XP',
                      style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Daily Goal', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12)),
              Text('${(viewModel.dailyProgress * 100).toInt()}%', style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: viewModel.dailyProgress,
              minHeight: 12,
              backgroundColor: AppColors.surfaceContainerLowest,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(color: AppColors.onSurface, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
          ),
      ],
    );
  }

  Widget _buildTaskItem(BuildContext context, DailyTaskModel task) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.onSurfaceVariant.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: (task.isCompleted ? AppColors.primary : AppColors.surfaceContainerHighest).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(task.icon, color: task.isCompleted ? AppColors.primary : AppColors.onSurfaceVariant, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(color: AppColors.onSurface, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                if (task.description.isEmpty)
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: task.progress,
                            minHeight: 4,
                            backgroundColor: AppColors.surfaceContainerLowest,
                            valueColor: AlwaysStoppedAnimation<Color>(task.isCompleted ? AppColors.primary : AppColors.primary.withOpacity(0.5)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        task.progressText,
                        style: TextStyle(color: task.isCompleted ? AppColors.primary : AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                else
                  Text(
                    task.description,
                    style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          if (task.isCompleted)
            AppButton(
              text: "CLAIM",
              width: 80,
              height: 36,
              onPressed: () {},
            )
          else
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                task.reward,
                style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWeeklyChallenge(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade900.withOpacity(0.4), AppColors.surfaceContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('EPIC CHALLENGE', style: TextStyle(color: AppColors.primary, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          ),
          const SizedBox(height: 8),
          const Text('THE AD CRUSADER', style: TextStyle(color: AppColors.onSurface, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
          const Text('Complete 100 ads in 7 days', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  text: '74',
                  style: TextStyle(color: AppColors.onSurface, fontSize: 24, fontWeight: FontWeight.w900),
                  children: [
                    TextSpan(text: '/100', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14, fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('REWARD', style: TextStyle(color: AppColors.primary, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                  Text('5,000 GEM', style: TextStyle(color: AppColors.secondary, fontSize: 18, fontWeight: FontWeight.w900)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: const LinearProgressIndicator(
              value: 0.74,
              minHeight: 6,
              backgroundColor: AppColors.surfaceContainerLowest,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallChallenge(IconData icon, String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.onSurfaceVariant.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: title.contains("Refer") ? AppColors.primary : AppColors.secondary, size: 32),
            const SizedBox(height: 24),
            Text(title.toUpperCase(), style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold)),
            Text(value, style: TextStyle(color: title.contains("Refer") ? AppColors.primary : AppColors.secondary, fontSize: 18, fontWeight: FontWeight.w900)),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialMission(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCPhOpamUYyMyrIAURD_Z_Hah-1WocdnfeslfeC0wwSHDgCtGL9Oo8JmNwJbnUhtKD5Af5hDxGoMHNfqr2JAh-mGfJh_YWiJwbAT423WiGto-6q1glpoxnbcZzlTgisc-3FRJAlq7iB0nNzsQZW0eZ4hYS5Mj7nQXnipvRkSMnPCv1TWiYeNNQswlo8fnRP9m9tq4Oexyhr8sTXZXaeVaXg03MnYwCH-UlCVD15m9bo1wMFJSCILcwErb4yufYP5cn_omxQ3B8sPg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [AppColors.surface.withOpacity(0.8), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('LIMITED TIME', style: TextStyle(color: AppColors.primary, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2.0)),
                    Text('The Emerald Heist', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text('START', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
