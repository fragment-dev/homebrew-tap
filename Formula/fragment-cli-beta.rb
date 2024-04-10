require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4864.0.0-darwin-x64.tar.gz"
    sha256 "356d87680c9e47c102d55e744ec340e9c2228bbc91e53118014087743f373dbc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4864.0.0-darwin-arm64.tar.gz"
      sha256 "dd0455f807d14cac03c614bcb281b40d26d806b3fe87eeeab86ee05b9d1789f2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4864.0.0-linux-x64.tar.gz"
    sha256 "1e8ba3d6cc04476d0415f37bc76928951a15e811cd6814770156576b911f6e4e"
  end
  version "4864.0.0"
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
