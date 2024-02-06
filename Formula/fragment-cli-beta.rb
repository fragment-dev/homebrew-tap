require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4503.0.0-darwin-x64.tar.gz"
    sha256 "4d7b8055905ce83380a16dc70168eb926df462e35c3412f7c1978817cc32a8ec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4503.0.0-darwin-arm64.tar.gz"
      sha256 "6096b8b058efe6a2cd35512d089530ca5a92b04dad5d5c75f906a94fc9163505"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4503.0.0-linux-x64.tar.gz"
    sha256 "ce48780bb16ad124f74034abb0f561d8d3b7128fe34a712cb995f6ddab5a68bd"
  end
  version "4503.0.0"
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
