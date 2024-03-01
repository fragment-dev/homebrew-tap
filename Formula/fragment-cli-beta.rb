require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4680.0.0-darwin-x64.tar.gz"
    sha256 "1d0bf664c069b8c190ad350abbc47e665eabf0ba83ed650ac56e430d5e1f45cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4680.0.0-darwin-arm64.tar.gz"
      sha256 "2e8f9a8aab74621205103dd1f8adbbdda1814b00924eafce94f624a1a93d7aab"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4680.0.0-linux-x64.tar.gz"
    sha256 "e3652877fe2f39f12a7dd150581444dba65fa04793675775482e3fed22faff65"
  end
  version "4680.0.0"
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
