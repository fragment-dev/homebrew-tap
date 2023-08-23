require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3363.0.0-darwin-x64.tar.gz"
    sha256 "2704fb471d9a8199abc712f684d68bb099e35f55fd7c6873dd16ee792b9fbc36"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3363.0.0-darwin-arm64.tar.gz"
      sha256 "fc0a6401926e85bd12212fe24ecb98266ff5e26ab3e221d002af4212181d702c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3363.0.0-linux-x64.tar.gz"
    sha256 "f0bd284954dbc6356d35bcf14c393ce54f4d13678230a8db43a666d6b905764a"
  end
  version "3363.0.0"
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
