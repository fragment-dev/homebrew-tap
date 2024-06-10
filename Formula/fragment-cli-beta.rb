require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5246.0.0-darwin-x64.tar.gz"
    sha256 "6a3acad403130eba9b84303929fa066f69fb28471d7b9b03161e2090ad4e8864"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5246.0.0-darwin-arm64.tar.gz"
      sha256 "9c3f0befe5ec261ceb0356c9dc3d89682f8116c43a96a820af227ab0d717de43"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5246.0.0-linux-x64.tar.gz"
    sha256 "aaa4625172b12270a839d989be0841cb865593286c61e25cfde403baa02a6f5c"
  end
  version "5246.0.0"
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
