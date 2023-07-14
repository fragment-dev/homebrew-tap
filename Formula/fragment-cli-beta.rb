require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3063.0.0-darwin-x64.tar.gz"
    sha256 "a3e78bd6f7f9860e6186f734daf0e28b0beb45533127cf50b131082ce4a0d0f1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3063.0.0-darwin-arm64.tar.gz"
      sha256 "1c7fb7b953a56b02480f88169329bdc60378626c4fda31eb17adef8bdb8c39e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3063.0.0-linux-x64.tar.gz"
    sha256 "2555693b42dd478623212451bf9f223bc4ebd16726439aefac739cbb70a28e74"
  end
  version "3063.0.0"
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
