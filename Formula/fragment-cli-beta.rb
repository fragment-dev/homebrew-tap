require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4512.0.0-darwin-x64.tar.gz"
    sha256 "9e8aa1cf1ed3197923938a925287b1523604af583d76bc0b096dc391eb2bdd68"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4512.0.0-darwin-arm64.tar.gz"
      sha256 "52fd02b9d6399aa5c1d74db83c5d17649e68bb0e0d750e2346f2cbdfbb31105a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4512.0.0-linux-x64.tar.gz"
    sha256 "b1f1b5aa70a5493a95cc1aed41f3a4b7694060143283e34c167f579c1f52f48c"
  end
  version "4512.0.0"
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
