<?php
namespace Wechat\ApiBundle\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\Config\FileLocator;

class ClearTokenCommand extends Command{

  protected function configure(){
    $this->setName('wechat:clear.token')
        ->setDescription('Clear token');
  }

  protected function execute(InputInterface $input, OutputInterface $output)
  {
    $this->getApplication()->getKernel()->getContainer()->get('my.Wechat')->WechatKey_access_token(true);
    $output->writeln('<info>clear token success</info>');
  }

}
