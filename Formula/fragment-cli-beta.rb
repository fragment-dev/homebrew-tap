require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3415.0.0-darwin-x64.tar.gz"
    sha256 "53c8e556f5dc455689065e7bc5bda010e214e80cbedbf946353cace55d8e1701"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3415.0.0-darwin-arm64.tar.gz"
      sha256 "15ce6e181843e957240f69701e83f58719bbb666dc744d1b00ac9af917009ba5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3415.0.0-linux-x64.tar.gz"
    sha256 "ae5886e88d1eb6c4bd494bb60cb14fd8650ee440b82b201fe0b6fade3ec1cfe5"
  end
  version "3415.0.0"
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
