require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2534.0.0-darwin-x64.tar.gz"
    sha256 "6d04d28e9c759e9fcca664d8eb4514386b7eb639bd94a198d3cde2079b775923"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2534.0.0-darwin-arm64.tar.gz"
      sha256 "5d2365db50c1c0de786e486a07984d935630b2fd3bde74d6a9f75607a517c56b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2534.0.0-linux-x64.tar.gz"
    sha256 "a072c7e319c63fdd7cf6445966983c193c25a83c01554db0b8bd2ac44aef5ae4"
  end
  version "2534.0.0"
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
