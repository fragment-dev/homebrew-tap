require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5343.0.0-darwin-x64.tar.gz"
    sha256 "b1bce047da7e6a52f39e47714f9ae4beb6bcaa6f6075d60874be62a3d9db7b27"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5343.0.0-darwin-arm64.tar.gz"
      sha256 "91a6561a984a6270e798d33f20b9ba4ef83fa1a98e20b880b8b45203ce83c1ed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5343.0.0-linux-x64.tar.gz"
    sha256 "22d46b4678f315146596a8b86e189e70b16589863d8c28025c63c23ad364e5b3"
  end
  version "5343.0.0"
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
