require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4255.0.0-darwin-x64.tar.gz"
    sha256 "9eab60ab152c31a3bb7f047e1679251ae2e2bb5fbba2e0992a11ac212b39ed97"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4255.0.0-darwin-arm64.tar.gz"
      sha256 "2091c718c920986fd046c48bfebcaf11a7785ed8a5c4ef7a12a4210de0ebe13b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4255.0.0-linux-x64.tar.gz"
    sha256 "a26ad5bad20b8d09ba42ccf4524f090afe3fb1b02f2e4a5a0866da8d0339da7e"
  end
  version "4255.0.0"
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
