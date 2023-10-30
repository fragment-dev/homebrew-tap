require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3929.0.0-darwin-x64.tar.gz"
    sha256 "b5bb374999ce1fd95d0ebdc5f8beb3fd2ba8d7de4b9e14d64890bb83c8825d70"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3929.0.0-darwin-arm64.tar.gz"
      sha256 "142fee996e6a2c5d9ebd6a708cb0730ba3b585271b89b47fa6dd90110ab3d222"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3929.0.0-linux-x64.tar.gz"
    sha256 "65294d254b87171d06eca8ff009591002d65c437af11d545f5dae86001ffbaea"
  end
  version "3929.0.0"
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
