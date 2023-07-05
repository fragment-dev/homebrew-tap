require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3005.0.0-darwin-x64.tar.gz"
    sha256 "d65d6c7f4740d3c388e117c6774a94c81bcba90a966c977fb1358d2966e906d3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3005.0.0-darwin-arm64.tar.gz"
      sha256 "00a7b823d8925cae533f0648296ad59021d34cd8c3a00b641997732d61cdc067"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3005.0.0-linux-x64.tar.gz"
    sha256 "13c6193e0c7ca0d9a64d72c58c48c7647cc7bb656f81cf5cb3dd00efc6133f4a"
  end
  version "3005.0.0"
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
