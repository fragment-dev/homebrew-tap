require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4434.0.0-darwin-x64.tar.gz"
    sha256 "8ca835cd73f2bd75a621092fc07e01681d7cf228d43e450c8a9d8b958d3b9184"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4434.0.0-darwin-arm64.tar.gz"
      sha256 "2af452e8e1b511d087fadbeddc7976159b1d6f2ac4e5c36481e876d13556fe46"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4434.0.0-linux-x64.tar.gz"
    sha256 "2d6cf97f4b35deeff8e7ec3e344b81af7706d62c07855b8420e71d9699fdeeb2"
  end
  version "4434.0.0"
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
