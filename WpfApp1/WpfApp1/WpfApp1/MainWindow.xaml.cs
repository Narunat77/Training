using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Cal_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int income = int.Parse(TxtIncome.Text);
                int expense = int.Parse(TxtExpense.Text);
                int OtherExpense = int.Parse(TxtOtherExpense.Text);

                if (income > expense)
                {
                    int remainPerDay = income - expense;
                    int calOfDays = OtherExpense / remainPerDay;
                    TxtCalDay.Text = calOfDays.ToString();
                }
                else
                {
                    TxtCalDay.Text = "impossible";
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

    }
}
