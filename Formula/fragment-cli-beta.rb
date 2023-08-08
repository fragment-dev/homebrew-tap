require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3259.0.0-darwin-x64.tar.gz"
    sha256 "87ba686ae52b4a06b28711f495cd8cb1ee341a1af1b289ccd64e696c8676f292"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3259.0.0-darwin-arm64.tar.gz"
      sha256 "b6baca94ca84a31aec2ae8bd45248498945722a5a85c888c8f5e146dab40e32d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3259.0.0-linux-x64.tar.gz"
    sha256 "e632316536a61f5da80ec05807a00ea9de948e3aeb756c6f631e6538fb7894b3"
  end
  version "3259.0.0"
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
