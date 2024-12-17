require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5913.0.0-darwin-x64.tar.gz"
    sha256 "1811d8e76dca601d58a9ebe3d515d70a70da2f10f3e2c88b0f7039cef8eb7629"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5913.0.0-darwin-arm64.tar.gz"
      sha256 "67d6e5a3e543e3a0dfc207e9ebeaa7645c4a5ba1e7a30e93160cec9f7fc02f3f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5913.0.0-linux-x64.tar.gz"
    sha256 "f1baac0afe0b1e253500ba336750ee7c429170a1d03d423a9ecca399e6643dcd"
  end
  version "5913.0.0"
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
