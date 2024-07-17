require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5407.0.0-darwin-x64.tar.gz"
    sha256 "2b3c795f4e59bf33522192c4110006ae87e0e7773b801ad2dc96b109cd9992ce"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5407.0.0-darwin-arm64.tar.gz"
      sha256 "0158ba2736cdd2c26f01647573fc89a1f206a6d61a867b5f7f955fe7b8d68536"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5407.0.0-linux-x64.tar.gz"
    sha256 "e064b305fe2020692136a2f0e1df14683469f9fa8464a0db6c3b3591dab9ccc5"
  end
  version "5407.0.0"
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
