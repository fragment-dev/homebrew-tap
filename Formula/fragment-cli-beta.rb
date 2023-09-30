require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3725.0.0-darwin-x64.tar.gz"
    sha256 "647a831f7464f1c4de70a996f94c3e5b50271d082c51163ae3838bb6dadca56a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3725.0.0-darwin-arm64.tar.gz"
      sha256 "12a8037e7aa85cca80c47cf7c4f3919d7ada25dc8478e8fb82bc48280736ad16"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3725.0.0-linux-x64.tar.gz"
    sha256 "ee63dd22cfba2827fd251a85e4bee2b4c9384b85a17945f7621288e724a4ef75"
  end
  version "3725.0.0"
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
