require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.17-darwin-x64.tar.gz"
    sha256 "e2c8e71aaac12b4c56803f3981f7ba43a773c4e1e66a2013dea9e84b2f1c2792"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.17-darwin-arm64.tar.gz"
      sha256 "ce9aa06d7077872534512e21b789bdaaa1dd1bd485ee80bf7bc69a61d55c7695"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.17-linux-x64.tar.gz"
    sha256 "af8a685be5b781d526e1f03198e61d5f0bd8ceba55c764bf45c6f405bdabb10b"
  end
  version "2024.1.17"
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
