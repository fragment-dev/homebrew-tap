require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5065.0.0-darwin-x64.tar.gz"
    sha256 "1fb553462ce81dbc2b50c0bb79d43737544447c5ac0d29de929880c5070ebfc5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5065.0.0-darwin-arm64.tar.gz"
      sha256 "148cf9a76ed7e4b31137fe75d76b56ceddc53932ba127f31a4dd763be063a7c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5065.0.0-linux-x64.tar.gz"
    sha256 "7930f9651845118790786b6d25df59be7f48bcf6a2ce5fbd94681063c5f5fdf9"
  end
  version "5065.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
