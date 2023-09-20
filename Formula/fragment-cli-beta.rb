require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3615.0.0-darwin-x64.tar.gz"
    sha256 "41dedbb67dc3e3702f1678922de51f18e082da305ecd208563f102fea5e7c783"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3615.0.0-darwin-arm64.tar.gz"
      sha256 "f0524c23b83610d71a50ce573fbd9a6531db7d2bbeec2d7f1bafa1ed25c051d3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3615.0.0-linux-x64.tar.gz"
    sha256 "53701d14a2d9cfd894d4b048fc2afd7eb563d66ea60e47913d19ee45b8933d14"
  end
  version "3615.0.0"
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
