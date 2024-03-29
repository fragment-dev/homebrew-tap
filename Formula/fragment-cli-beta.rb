require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4819.0.0-darwin-x64.tar.gz"
    sha256 "78b625be707937ac1a006680a92f18079a904934de3f8d4b38479f26d90220d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4819.0.0-darwin-arm64.tar.gz"
      sha256 "f6fac365ba62901408608d154ce17ed23f81f5fa38ef8d1d111c25fe2da1a4b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4819.0.0-linux-x64.tar.gz"
    sha256 "abe81f8562c572d005cc1b9b3d49b7f98666b4164855d80b1526428c7792fdb4"
  end
  version "4819.0.0"
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
