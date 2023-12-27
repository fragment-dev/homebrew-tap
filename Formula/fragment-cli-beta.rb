require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4222.0.0-darwin-x64.tar.gz"
    sha256 "84dd1084e7f212ab7b6143d4ef26e8afd43eb92caeae15e14486232850a95a8a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4222.0.0-darwin-arm64.tar.gz"
      sha256 "edbba47d6d36248f6dcd65cd9f83dd4564ec50c98b0e1ac708ccef65f022ea70"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4222.0.0-linux-x64.tar.gz"
    sha256 "50b0a36c2519d352218d32be786a9e13757dd3b9404873329cc4c3b99072d18a"
  end
  version "4222.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
