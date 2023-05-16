require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2674.0.0-darwin-x64.tar.gz"
    sha256 "6bfd8765f408b7ad3ef8b9284ce178e3daa679dd18a2e865052525e46cb58e1d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2674.0.0-darwin-arm64.tar.gz"
      sha256 "b9985f5b40d3296b4aac727349e34a604766c2016a447d940ad4c799ab45c78b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2674.0.0-linux-x64.tar.gz"
    sha256 "e094c4b24ff11f1e1c0d5d346831940663c70a891252ae161b218589b52d412f"
  end
  version "2674.0.0"
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
