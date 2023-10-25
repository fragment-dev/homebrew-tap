require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3903.0.0-darwin-x64.tar.gz"
    sha256 "d3b295de3cf7c88acada3450e775955203f4d842c04b4fe068ca9e09f85cc1ba"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3903.0.0-darwin-arm64.tar.gz"
      sha256 "5e550bf3cde9d5f43f09f5a756eb9bb69c0a557f6790c115d24a96086e5376cc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3903.0.0-linux-x64.tar.gz"
    sha256 "a06fb320641da982b42a5e4f3762f447f83a02731d90723d594ee671c9396e62"
  end
  version "3903.0.0"
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
