require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1955.0.0-darwin-x64.tar.gz"
    sha256 "4c1a8ea58eaba09282b8d9015f9d3bf5659cb84d6f782dacbf3fa5cfbe600a54"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1955.0.0-darwin-arm64.tar.gz"
      sha256 "fd21b545fd62f00ce0c1dec015ad881ac915999c4f9c992f03f9fcd2cf3b082e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1955.0.0-linux-x64.tar.gz"
    sha256 "c5f720effbdeb5165b55d7eb1bd99b0bce123fe69189bcb3266c85ab2521acc5"
  end
  version "1955.0.0"
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
