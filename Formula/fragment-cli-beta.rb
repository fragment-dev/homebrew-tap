require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2234.0.0-darwin-x64.tar.gz"
    sha256 "14c75b8af5ad60e4ab8e6caf08c8da07dc4119d1fdd84b1bd3a4c0c82d96f9c3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2234.0.0-darwin-arm64.tar.gz"
      sha256 "31aea169a3970600b0c2fef6003d7ccec5db986e7d688a73c2b22b822a1a06ae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2234.0.0-linux-x64.tar.gz"
    sha256 "5b421812615cf961bb019acad41c492b84f33a61d2edc30f7ef3a8df0dad9248"
  end
  version "2234.0.0"
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
