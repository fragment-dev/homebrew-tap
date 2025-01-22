require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-darwin-x64.tar.gz"
    sha256 "f65f145e94f694a9988b6bd5eae831ceb66099e6437ddba6b472fabe61cdb1b3"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-darwin-arm64.tar.gz"
      sha256 "9136ebaa8c813131816eff581b6c30a039b8fc48d01b45ba9a03b489e0cb989e"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.22-linux-x64.tar.gz"
    sha256 "9db4a76ccf87d5cb9cfa0be574f7cf5f816fb3b072ec753df9b47332146ad983"
  end
  version "2025.1.22"
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
