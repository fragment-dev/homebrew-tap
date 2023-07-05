require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.4-darwin-x64.tar.gz"
    sha256 "96dd562e236185a11d6c8674cbdbd8cd797808201ee128b8e430df589dfc10d0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.4-darwin-arm64.tar.gz"
      sha256 "998ed65beead55940a9441ce49aef21f500e5f9c0def393bfd95b0a251f1c585"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.4-linux-x64.tar.gz"
    sha256 "f633bce131b42bec4be75c1c79d57b5a276c6977a70d1b3d5dff692b59e4c55d"
  end
  version "2023.7.4"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
