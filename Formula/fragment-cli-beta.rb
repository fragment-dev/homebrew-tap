require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2793.0.0-darwin-x64.tar.gz"
    sha256 "2c36c5768ef37ff5e39831297d2800ebfae7d0f3e79f00341e71c332c4718427"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2793.0.0-darwin-arm64.tar.gz"
      sha256 "f7fdf515c63dc281f7a76d11f2c2a8e54ef847753609690e067d80b2571c9483"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2793.0.0-linux-x64.tar.gz"
    sha256 "91a632d29d11f74488224518984ba6e146aabd8016ba6a00ce5bc2bd42283ea6"
  end
  version "2793.0.0"
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
