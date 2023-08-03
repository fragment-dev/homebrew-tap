require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3218.0.0-darwin-x64.tar.gz"
    sha256 "8c6de1056b828a3d694f64b749fdefd4465ad107f190ffc7eb6d7da6adaa82ee"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3218.0.0-darwin-arm64.tar.gz"
      sha256 "81093aadadfcd24ad6b6eb02a151755ba26f2411af8783265993f143d03677fa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3218.0.0-linux-x64.tar.gz"
    sha256 "3481d525cb8951f2e1372628f41ed8084f4c06ad62837f9b17fc8d5e45f1153c"
  end
  version "3218.0.0"
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
