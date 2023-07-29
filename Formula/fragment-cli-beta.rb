require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3192.0.0-darwin-x64.tar.gz"
    sha256 "d7c89443cd4506acd7b9fa87885539ece1139ba075dd03f86d713eb4331bb218"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3192.0.0-darwin-arm64.tar.gz"
      sha256 "e59f05c8828611045773b0bacedc67f63fe338d812e588d4a6d4ee57a801d0a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3192.0.0-linux-x64.tar.gz"
    sha256 "027798c24e824edc4457d0bf476c7d5f1e094f355d94e5c0041397006cd3c46e"
  end
  version "3192.0.0"
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
