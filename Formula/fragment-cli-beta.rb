require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2647.0.0-darwin-x64.tar.gz"
    sha256 "90a188e5d8f72095975d186fb70822caf378c21f07d7c2354911aa3383741a45"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2647.0.0-darwin-arm64.tar.gz"
      sha256 "69af0e82cd0c9b1fd3a9a5ead7e370dc327a65aa710df4f0b81d2f61e5bf9bf3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2647.0.0-linux-x64.tar.gz"
    sha256 "ed58013817a33902781fac3f77c73b0a79db2d3936fe04d3e7b6291c220e44b4"
  end
  version "2647.0.0"
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
