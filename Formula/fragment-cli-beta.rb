require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4041.0.0-darwin-x64.tar.gz"
    sha256 "c164c45de6d880c31f05647b586790367328957ae7d188592e01db9122ec5cfe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4041.0.0-darwin-arm64.tar.gz"
      sha256 "f2b6df0fa1ca87643781cdf7723c2181068f100876dd069fb28db0eafafbeae6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4041.0.0-linux-x64.tar.gz"
    sha256 "59a03acea3012e25fa5b7447214953a4de01546cabe92d3a6ab87f07f184c950"
  end
  version "4041.0.0"
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
