require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3067.0.0-darwin-x64.tar.gz"
    sha256 "e76f790fa4b05fcd9afd7872855ba76c6b835597fc4400f46e6d3c21cf39b4f0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3067.0.0-darwin-arm64.tar.gz"
      sha256 "93393e88881fc1ef5e5533324dc9d8dfdbdbcb39be29b0d2352a1e5ff726bb1b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3067.0.0-linux-x64.tar.gz"
    sha256 "5a261a3d70b9e1c6256eafbf495542497d8eb36764ebee44a6a6f489ed274f38"
  end
  version "3067.0.0"
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
