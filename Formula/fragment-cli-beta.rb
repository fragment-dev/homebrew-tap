require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5113.0.0-darwin-x64.tar.gz"
    sha256 "18b10033981e069d07a5f982ad3ff4da5c68bb854914a756fa84bb7e22bf1b8e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5113.0.0-darwin-arm64.tar.gz"
      sha256 "901706986b91ca0f6a863c1e241164e9cddd0bc181b3d1b000acb645c8777cb8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5113.0.0-linux-x64.tar.gz"
    sha256 "27f355ae757a9ba300f0edd205aebe68a6da9bb86264891d661448463288a7f6"
  end
  version "5113.0.0"
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
