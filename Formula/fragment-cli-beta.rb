require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5172.0.0-darwin-x64.tar.gz"
    sha256 "922193d0abc9ce35433aa33173caa99286b1c9a77f0dfaa35ff464acf24b37ad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5172.0.0-darwin-arm64.tar.gz"
      sha256 "652941bee38eb5e36fbde39478fa478f692c1c0286308e0e499c4dd7354a7569"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5172.0.0-linux-x64.tar.gz"
    sha256 "ce7b1ff2660cf9f8511c386a172742f2e7acebacfd029289099f6d37667a648e"
  end
  version "5172.0.0"
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
