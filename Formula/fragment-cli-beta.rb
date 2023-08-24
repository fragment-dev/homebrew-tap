require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3381.0.0-darwin-x64.tar.gz"
    sha256 "e05ff103df9f6092c7ea5891b840630648c6803e0ec81f9860924bea4368f1c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3381.0.0-darwin-arm64.tar.gz"
      sha256 "9dca52716b34975dfdb08ded9f70f77e8caa707287627126210ade858435645c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3381.0.0-linux-x64.tar.gz"
    sha256 "b21680a3701eeb4fbcc949f3c9065bc164e9462b2d5f81bd728202c848603208"
  end
  version "3381.0.0"
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
