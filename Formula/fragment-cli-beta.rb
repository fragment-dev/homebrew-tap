require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4405.0.0-darwin-x64.tar.gz"
    sha256 "17adcf08f9a6818b6df88113a3330fa4940366cc77756a421d5abc0d114d74fa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4405.0.0-darwin-arm64.tar.gz"
      sha256 "ebf76e3442c072c274eb8db8e27b34172cf33b2320de0837794560363d123c72"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4405.0.0-linux-x64.tar.gz"
    sha256 "5414d6e94b53151253f6cace1b36a9e1a7852795771ea6bbe29f952848a0d4b5"
  end
  version "4405.0.0"
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
