require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4564.0.0-darwin-x64.tar.gz"
    sha256 "7a46065b2df6d833ba2631d98d1ce7d3b474523ec65fbce98fe8bd64a9ab8d72"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4564.0.0-darwin-arm64.tar.gz"
      sha256 "6a3d4366d1b9b2dc8eed2eaea16f59e2c46369f288279aa78cb8e126b488f0a4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4564.0.0-linux-x64.tar.gz"
    sha256 "6de79826efff3265b04ae20e0c55922d2abdc94c3048abd23de230b3a690011b"
  end
  version "4564.0.0"
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
