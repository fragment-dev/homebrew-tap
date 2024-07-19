require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5413.0.0-darwin-x64.tar.gz"
    sha256 "6f84d115b67891913277c3786912614e7340278a625862e36d4706187bb43fc0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5413.0.0-darwin-arm64.tar.gz"
      sha256 "00125537a9bf8211c6fcfae6e7b3d7867c571f8c5a07fecfda22b0082be6f302"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5413.0.0-linux-x64.tar.gz"
    sha256 "1af8d6a569f315f7e5ea057c91e17ca52aa69dd726ba2f6113ec42906214b020"
  end
  version "5413.0.0"
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
