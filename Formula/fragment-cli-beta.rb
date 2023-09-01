require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3467.0.0-darwin-x64.tar.gz"
    sha256 "282c68f0acfe7d1dd4256161b69a0b2fb88284109486542ef67a85aea06b7e2d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3467.0.0-darwin-arm64.tar.gz"
      sha256 "6f1c244c112c0023e6d91780e9d2b4d7c5882798f9bef28391bd08f5f45f7007"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3467.0.0-linux-x64.tar.gz"
    sha256 "e52875271264a1537916d45323a8554dc47b318d182a14120b41008699573f03"
  end
  version "3467.0.0"
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
