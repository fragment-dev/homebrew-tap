require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2738.0.0-darwin-x64.tar.gz"
    sha256 "472efa88477848db41b9a29cc9c5fd8c972f61c4aac33a567dd176812ff9e5c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2738.0.0-darwin-arm64.tar.gz"
      sha256 "ebc5fecd55f9a3ce4faa4911b474579ef8c165edc1f1bb593f4ba487d0d9e534"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2738.0.0-linux-x64.tar.gz"
    sha256 "c83f6bc0071e4845d064aaeb3181f2b17d87f2b9948fbf64cac59c21a00fed94"
  end
  version "2738.0.0"
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
