require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4673.0.0-darwin-x64.tar.gz"
    sha256 "84f6e66722ac0ea8bb6a88222c6ea7fc3566c970574ed1afb21280348c2d5424"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4673.0.0-darwin-arm64.tar.gz"
      sha256 "567c37eba00789084f1a718361d0ed3b33855ac860e97bdb27e4b36808ee5bd8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4673.0.0-linux-x64.tar.gz"
    sha256 "16c23cf898a7fc4a45dfca80ed10114232909240cf2b518c2d66e7f666386aec"
  end
  version "4673.0.0"
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
