require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5338.0.0-darwin-x64.tar.gz"
    sha256 "e4539c96d148955486319760442452fa599e32a7f9c67027424ae43d9a112724"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5338.0.0-darwin-arm64.tar.gz"
      sha256 "41845f89af254adb398dfb897697cdf41eac39eaf68e788ba8f3aecdc0f91666"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5338.0.0-linux-x64.tar.gz"
    sha256 "11a8a1c86c4f168462ebfd52177482d1d19101da3d687bae687469af1d518daf"
  end
  version "5338.0.0"
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
