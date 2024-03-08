require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4734.0.0-darwin-x64.tar.gz"
    sha256 "3fcbd4682ced0c15475cccef95a09617d7e1b52f750aa2d4aab60cfeb5a1d041"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4734.0.0-darwin-arm64.tar.gz"
      sha256 "a723b1bb6818a52ce6efb171c2a85e144a6ebdcf2b3f0d91d313f02e9739254e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4734.0.0-linux-x64.tar.gz"
    sha256 "2b0fd8fcc12c6fae9f57448516f34d6221d9755d9a631daa4a3b1834f1b373c9"
  end
  version "4734.0.0"
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
