require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5777.0.0-darwin-x64.tar.gz"
    sha256 "ac750fb3448c847503b6b6907a04ef74ba74ae7660f2d7a669e7f60d5b6cf1f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5777.0.0-darwin-arm64.tar.gz"
      sha256 "50182c1f399feda50019c7c73b5f27eb50e956c0c3ef7d7009828addbff8f333"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5777.0.0-linux-x64.tar.gz"
    sha256 "4d877bc401e7c57a2158daa101948fcefe24f4ff7c646080487fd941ac1c6530"
  end
  version "5777.0.0"
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
