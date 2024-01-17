require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4345.0.0-darwin-x64.tar.gz"
    sha256 "56e4333af430262402a933e31b52a2fca5a67e27c497691105e4c9fc8ceeb7ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4345.0.0-darwin-arm64.tar.gz"
      sha256 "7bf5df83f39fcf57f34d72453e0517651b55b0354c595962094a9aa3cde6924e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4345.0.0-linux-x64.tar.gz"
    sha256 "7f913afb1e7f87e37eeba225c93c97abe678e4b683dbcd410d7137268d81bdb9"
  end
  version "4345.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
