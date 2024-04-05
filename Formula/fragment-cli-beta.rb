require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4855.0.0-darwin-x64.tar.gz"
    sha256 "72f6ea2f01d32ae2ec870bcb253cc3e599a48b66aeea6c0dc8d17f6468b3130d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4855.0.0-darwin-arm64.tar.gz"
      sha256 "320e185f29f3be961cbdac454f1d92101ad507aee3f739749d66ca55bad03d8e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4855.0.0-linux-x64.tar.gz"
    sha256 "a8fd7b09db53aa05c532b73d1a01ce8144593972a2019e2482d25c35712f24ec"
  end
  version "4855.0.0"
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
