require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4685.0.0-darwin-x64.tar.gz"
    sha256 "7a7bb1b73c74759935e7675e81bc55475e648030c4b025253e478b1a2edf5f57"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4685.0.0-darwin-arm64.tar.gz"
      sha256 "490a7b0da5088ffb223d356bdd294a483f03790af25ac65e58270825b81d9bfc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4685.0.0-linux-x64.tar.gz"
    sha256 "7e228116b33128e13625438b9e1212a4640c139a16de9a84e05f55cdb4e95d67"
  end
  version "4685.0.0"
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
