require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5100.0.0-darwin-x64.tar.gz"
    sha256 "696eb0ae2f432c384b9b9f5714e0f0b015f506cac71e3409df8d962b7a6b7e8a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5100.0.0-darwin-arm64.tar.gz"
      sha256 "9e731c2d80b3c46e13bcf96cfd8dcdd96addd2a54117c529591c6d1bf2657ebd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5100.0.0-linux-x64.tar.gz"
    sha256 "154787f6747721259e15960cdaec05f751bc22ca67670d79fef493afaa37f2ae"
  end
  version "5100.0.0"
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
