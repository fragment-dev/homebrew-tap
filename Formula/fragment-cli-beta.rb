require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5031.0.0-darwin-x64.tar.gz"
    sha256 "44eccd096bea8e44470f68851d10f9dcec111cae050981836e911b393e04f902"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5031.0.0-darwin-arm64.tar.gz"
      sha256 "ab08724a157369d10b7382a934f091241d94c965f603757c5bc265ed0223983e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5031.0.0-linux-x64.tar.gz"
    sha256 "3520c2edfaafaa224067d75c2274859005ea35888bd945dcb50932ff171325e8"
  end
  version "5031.0.0"
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
